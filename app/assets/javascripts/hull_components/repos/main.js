Hull.widget('repos', {
  templates: ['repos'],

  refreshEvents: ['model.hull.me.change'],

  datasources: {
    repos: function() {
      if (this.options.login) {
        return this.api({ path: 'users/' + this.options.login + '/repos', provider: 'github', params: { per_page: 10 } });  
      }
    }
  },

  initialize: function() {
    console.warn("YO!");
  },

  beforeRender: function(data) {
    console.warn("Rendering...", data.repos);
  },

  actions: {
    askForMatch: function(event, action) {
      console.warn("Repos: ", this.data);
      console.warn("Selected Repo: ", action.data.repo);
    }
  }

});