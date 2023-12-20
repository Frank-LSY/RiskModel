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
                component: () => import('@components/HelloWorld.vue'),
                name: '检查',
                meta: {
                    isLogin: false,
                    title: '疾病风险全因素分析-查询',
                    index: 1
                },
            },
        ]
    },

]

// 创建路由对象
const router = createRouter({
    history: createWebHashHistory(),
    base: '/riskModel/',
    routes
})
export default router;