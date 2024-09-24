
	// DO NOT EDIT - AUTO GENERATED FROM vite.config.js

	// This file solely exists to enable type support in Vue VSCode extension
	// https://stackoverflow.com/a/70980761/3779853

	import { RecycleScroller } from 'vue-virtual-scroller'
	import App from './App.vue'
	import AllBranches from './views/AllBranches.vue'
	import CommitDetails from './views/CommitDetails.vue'
	import CommitRow from './views/CommitRow.vue'
	import CommitsDetails from './views/CommitsDetails.vue'
	import FilesDiffsList from './views/FilesDiffsList.vue'
	import GitActionButton from './views/GitActionButton.vue'
	import GitInput from './views/GitInput.vue'
	import History from './views/History.vue'
	import MainView from './views/MainView.vue'
	import RefTip from './views/RefTip.vue'
	import RepoSelection from './views/RepoSelection.vue'
	import SVGVisualization from './views/SVGVisualization.vue'
	import SelectedGitAction from './views/SelectedGitAction.vue'
	import Popup from './components/Popup.vue'
	import PromiseForm from './components/PromiseForm.vue'

	declare module '@vue/runtime-core' {
		export interface GlobalComponents {
			RecycleScroller: typeof RecycleScroller
			History: typeof History
			App: typeof App
			AllBranches: typeof AllBranches
			CommitDetails: typeof CommitDetails
			CommitRow: typeof CommitRow
			CommitsDetails: typeof CommitsDetails
			FilesDiffsList: typeof FilesDiffsList
			GitActionButton: typeof GitActionButton
			GitInput: typeof GitInput
			History: typeof History
			MainView: typeof MainView
			RefTip: typeof RefTip
			RepoSelection: typeof RepoSelection
			SVGVisualization: typeof SVGVisualization
			SelectedGitAction: typeof SelectedGitAction
			Popup: typeof Popup
			PromiseForm: typeof PromiseForm
		}
	}