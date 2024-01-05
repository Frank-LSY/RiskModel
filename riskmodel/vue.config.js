const path = require('path')

const resolve = dir => {
  return path.join(__dirname, dir)
}



module.exports = {
  lintOnSave: false,
  publicPath: '/riskModel/',
  outputDir: 'riskModel',
  devServer: {
    port: 8088,
    open: false,
    proxy: {
      '/ydr': {
        target: 'http://127.0.0.1:5000',
        changeOrigin: true,
        secure: false,
        pathRewrite: {
          '^/ydr': ''
        }
      },
    }
  },
  chainWebpack: config => {
    config.resolve.alias
      .set("@", resolve("src"))
      .set("@assets", resolve("src/assets"))
      .set("@components", resolve("src/components"))
      .set("@charts", resolve("src/charts"))
      .set("@disease",resolve("src/disease"))
      .set("@utils", resolve("src/assets/utils"))
      .set("@api", resolve("src/api"))
    config.module
      .rule('svg')
      .exclude.add(resolve('src/assets/icons'))
      .end()
    config.module
      .rule('icons')
      .test(/\.svg$/)
      .include.add(resolve('src/assets/icons'))
      .end()
      .use('svg-sprite-loader')
      .loader('svg-sprite-loader')
      .options({
        symbolId: 'icon-[name]'
      })
      .end()
      config.module
      .rule('fbx')
      .test(/\.(fbx|FBX|obj)$/)
      .use('file-loader')
      .loader('file-loader')
      .end()
      config.module
      .rule('flv')
      .test(/\.(flv)$/)
      .use('url-loader')
      .loader('url-loader')
      .end()
  },
  configureWebpack: {
    resolve: {
      alias: {

      },
      fallback: {
        http: require.resolve("stream-http"),
        stream: require.resolve("stream-browserify"),
        // util: require.resolve("util/"),
        crypto: require.resolve("crypto-browserify"),
        https: require.resolve("https-browserify")

      },
    },
  },
};