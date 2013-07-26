Hull.widget('activity', {
  templates: ['github-activity'],

  refreshEvents: ['model.hull.me.change'],

  datasources: {
    activity: function() {
      if (this.options.login) {
        return this.api({ path: 'users/' + this.options.login + '/events', provider: 'github' });
      }
    }
  },

  initialize: function() {
    console.warn("YO!");
  },

  beforeRender: function(data) {
    console.warn("Rendering... Activity", data.activity);
  },

  actions: {
    selectRepo: function(event, action) {
      console.warn("Repos: ", this.data);
      console.warn("Selected Repo: ", action.data.repo);
    }
  }

});

