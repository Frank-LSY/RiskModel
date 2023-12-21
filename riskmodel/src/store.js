import { createStore } from 'vuex';

export default createStore({
    state: {
        chineseStyle: true, //中国风
        isLogin: false //是否登录
    },
    getters: {
        getChineseStyle: (state) => {
            return state.chineseStyle
        },
        getLogin: (state) => {
            return state.isLogin
        }
    },
    mutations: {
        changeChineseStyle: (state, value) => {
            return state.chineseStyle = value
        },
        changeLoginStatus: (state, value) => {
            return state.isLogin = value
        }
    },
    actions: {

    }
})