const startDevServer = require('@cypress/react/plugins/react-scripts');
/**
 * @type {Cypress.PluginConfig}
 */
module.exports = (on, config) => {
    // dev server
    startDevServer(on, config);

    // IMPORTANT to return the config object
    // with the any changed environment variables
    return config;
};
