import { get } from "@/assets/js/request"

export default {
    // 获取某用户信息
    user: query => get('/ydr/user', query),
    // 获取某用户所有问卷
    userPolls: query => get('/ydr/user_polls', query),
    // 获取某问卷所有疾病风险
    pollDiseases: query => get('/ydr/poll_diseases', query),
    // 获取某问卷，所有疾病风险
    pollDetails: query => get('/ydr/poll_details', query),
    // 获取某问卷，某疾病，所有风险
    pollRisks: query => get('/ydr/poll_risks', query),

    // 获取某问卷，肺癌，细节
    lungDetails: query => (get('/ydr/lung_details', query))
}