import { createApp } from 'vue'
import App from './App.vue'
import './index.css'
import './assets/font/iconfont.css'
import './assets/font/iconfont'
import router from './router'
import store from './store'

import SvgIcon from '@/components/SvgIcon.vue'

import Toast from "vue-toastification"
import "vue-toastification/dist/index.css"

const app = createApp(App)

app.component('SvgIcon', SvgIcon)
app.use(router)
app.use(store)
app.use(Toast, {
    transition: "Vue-Toastification__fade",
    maxToasts: 20,
    newestOnTop: true
})
app.mount('#app')