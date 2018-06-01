const path = require('path');

const merge = require('webpack-merge');

const base = require('./webpack.base');

module.exports = merge.smart(base, {
    mode: 'development',
    devtool: 'eval',
    devServer: {
        port: 3000,
        compress: true,
        open: true,
        publicPath: '/dist/'
    },
    module: {
        rules: [
            {
                test: /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                use: [
                    {
                        loader: 'elm-hot-loader'
                    },
                    {
                        loader: 'elm-webpack-loader',
                        options: {
                            debug: true,
                            warn: true
                        }
                    }
                ]
            },
            {
                include: path.resolve(__dirname, '../node_modules/normalize.css'),
                use: [
                    'style-loader',
                    'css-loader'
                ]
            }
        ]
    }
});