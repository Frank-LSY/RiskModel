import { createStore } from 'vuex';

export default createStore({
    state: {
        chineseStyle: true, //中国风
        isLogin: false, //是否登录
        currentDisease: {} //当前是那种疾病
    },
    getters: {
        getChineseStyle: (state) => {
            return state.chineseStyle
        },
        getLogin: (state) => {
            return state.isLogin
        },
        getCurrentDisease: (state) => {
            return state.currentDisease
        },
    },
    mutations: {
        changeChineseStyle: (state, value) => {
            return state.chineseStyle = value
        },
        changeLoginStatus: (state, value) => {
            return state.isLogin = value
        },
        changeCurrentDisease: (state, value) => {
            return state.currentDisease = value
        },
    },
    actions: {

    }
})