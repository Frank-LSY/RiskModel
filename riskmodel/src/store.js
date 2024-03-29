import { createStore } from 'vuex';

export default createStore({
    state: {
        chineseStyle: true, // 中国风
        isLogin: false, // 是否登录
        currentUser: {}, // 当前用户信息
        currentPoll: [], //当前问卷信息
        currentPollId: '', //当前问卷id
        currentDisease: {}, // 当前是那种疾病
        currentDetails: [], //当前疾病具体风险值
        lungStatus: '',
        descriptionDialog: {}, //是否显示具体描述
    },
    getters: {
        getChineseStyle: (state) => {
            return state.chineseStyle
        },
        getLogin: (state) => {
            return state.isLogin
        },
        getCurrentUser: (state) => {
            return state.currentUser
        },
        getCurrentPoll: (state) => {
            return state.currentPoll
        },
        getCurrentPollId: (state) => {
            return state.currentPollId
        },
        getCurrentDisease: (state) => {
            return state.currentDisease
        },
        getCurrentDetails: (state) => {
            return state.currentDetails
        },
        getLungStatus: (state) => {
            return state.lungStatus
        },
        getDescriptionDialog: (state) => {
            return state.descriptionDialog
        }
    },
    mutations: {
        changeChineseStyle: (state, value) => {
            return state.chineseStyle = value
        },
        changeLoginStatus: (state, value) => {
            return state.isLogin = value
        },
        changeCurrentUser: (state, value) => {
            return state.currentUser = value
        },
        changeCurrentPoll: (state, value) => {
            return state.currentPoll = value
        },
        changeCurrentPollId: (state, value) => {
            return state.currentPollId = value
        },
        changeCurrentDisease: (state, value) => {
            return state.currentDisease = value
        },
        changeCurrentDetails: (state, value) => {
            return state.currentDetails = value
        },
        changeLungStatus: (state, value) => {
            return state.lungStatus = value
        },
        changeDescriptionDialog: (state, value) => {
            return state.descriptionDialog = value
        },
    },
    actions: {

    }
})