import {
    createRouter,
    createWebHashHistory,
} from 'vue-router'

const routes = [
    // 路由的默认路径
    {
        path: '/',
        redirect: "/riskModel",
        meta: {
            title: '肺癌风险预测问卷'
        }
    },

]

// 创建路由对象
const router = createRouter({
    history: createWebHashHistory(),
    base: '/riskModel/',
    routes
})
export default router;