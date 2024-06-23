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
            title: '疾病风险全因素分析'
        }
    },
    {
        path: '/riskModel',
        component: () => import('@/Structure.vue'),
        redirect: "/query",
        name: '主页',
        meta: {
            isLogin: false,
            title: '疾病风险全因素分析',
            index: 1
        },
        children: [
            {
                path: '/query',
                component: () => import('@components/Check.vue'),
                name: '检查',
                meta: {
                    isLogin: false,
                    title: '疾病风险全因素分析-查询',
                    index: 2
                },
            },
            {
                path: '/history',
                component: () => import('@components/History.vue'),
                name: '报告记录',
                meta: {
                    isLogin: false,
                    title: '疾病风险全因素分析-报告记录',
                    index: 3
                },
            },
            {
                path: '/cardiovascular',
                component: () => import('@components/Cardiovascular.vue'),
                name: '报告记录',
                meta: {
                    isLogin: false,
                    title: '疾病风险全因素分析-报告记录',
                    index: 3
                },
            },
        ]
    },
        {
        // 一切没的页面导向404
        path: '/:catchAll(.*)',
        redirect: '/riskModel',
    },

]

// 创建路由对象
const router = createRouter({
    history: createWebHashHistory(),
    base: '/riskModel/',
    routes
})
export default router;