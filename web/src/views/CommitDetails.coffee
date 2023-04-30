import { ref, computed, defineComponent, watchEffect } from 'vue'
import { git, open_diff, get_config } from '../bridge.coffee'
import { commit_actions, stash_actions, branch_actions } from './store.coffee'
import { parse_config_actions } from './GitInput.coffee'
import GitActionButton from './GitActionButton.vue'
import RefTip from './RefTip.vue'
``###*
# @typedef {import('./types').Commit} Commit
###
###* @template T @typedef {import('vue').Ref<T>} Ref ###
###* @template T @typedef {import('vue').ComputedRef<T>} ComputedRef ###

export default defineComponent
	emits: ['change']
	components: { GitActionButton, RefTip }
	props:
		commit:
			###* @type {() => Commit} ###
			type: Object
			required: true
	setup: (props) ->
		branch_tips = computed =>
			props.commit.refs.filter (ref) =>
				ref.type == "branch"

		stash = computed =>
			props.commit.refs.find (ref) =>
				ref.type == "stash"
		
		``###* @type {Ref<{path:string,insertions:number,deletions:number}[]>} ###
		changed_files = ref []
		body = ref ''
		watchEffect =>
			get_files_command =
				if stash.value
					# so we can see untracked as well
					"stash show --include-untracked --numstat --format=\"\" #{props.commit.hash}"
				else
					"diff --numstat --format=\"\" #{props.commit.hash} #{props.commit.hash}~1"
			changed_files.value = (try await git get_files_command)
				?.split('\n').map((l) =>
					split = l.split('\t')
					path: split[2]
					insertions: Number split[1]
					deletions: Number split[0]) or []
			body.value = await git "show -s --format=\"%b\" #{props.commit.hash}"
		
		show_diff = (###* @type string ### filepath) =>
			open_diff props.commit.hash, filepath
		
		_commit_actions = computed =>
			parse_config_actions(commit_actions.value, [['{COMMIT_HASH}', props.commit.hash]])
		_branch_actions = (###* @type string ### branch_name) =>
			parse_config_actions(branch_actions.value, [['{BRANCH_NAME}', branch_name]])
		_stash_actions = computed =>
			parse_config_actions(stash_actions.value, [['{COMMIT_HASH}', props.commit.hash]])

		{
			branch_tips
			stash
			changed_files
			show_diff
			body
			commit_actions: _commit_actions
			branch_actions: _branch_actions
			stash_actions: _stash_actions
		}