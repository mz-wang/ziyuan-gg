const path = require('path');

const merge = require('webpack-merge');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

const base = require('./webpack.base');

module.exports = merge.smart(base, {
    mode: 'production',
    devtool: '(none)',
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
                            debug: false,
                            warn: false
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
    },
    optimization: {
        minimizer: [
            new UglifyJSPlugin({
                cache: true,
                parallel: true,
                sourceMap: true,
                exclude: [/elm-stuff/, /node_modules/]
            })
        ]
    }
});