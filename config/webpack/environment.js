const { environment } = require('@rails/webpacker')

const { VueLoaderPlugin } = require('vue-loader')
 environment.plugins.prepend(
     'VueLoaderPlugin',
     new VueLoaderPlugin()
)

environment.loaders.prepend('vue', {
    test: /\.vue$/,
    use: [{
        loader: 'vue-loader'
    }]
})

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery'
}));

module.exports = environment
