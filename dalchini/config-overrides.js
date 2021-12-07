// config-overrides.js

const StylelintPlugin = require('stylelint-webpack-plugin');

module.exports = {
  webpack: function (config, env) {
    if (env === 'development') {
      config.plugins.push(
        new StylelintPlugin({
          extends: 'stylelint-config-standard',
          plugins: ['stylelint-scss'],
          rules: {
            'at-rule-no-unknown': null,
            'scss/at-rule-no-unknown': true,
            'no-descending-specificity': null
          }
        })
      );
    }

    return config;
  }
};
