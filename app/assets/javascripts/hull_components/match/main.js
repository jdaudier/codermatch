Hull.widget('match', {
  templates: ['matches'],
  datasources: {
    matches: function() {
      // Fetch data from your server here... for search results
    },

    repos: function() {
      if (this.options.login) {
        return this.api({ path: 'users/' + this.options.login + '/repos', provider: 'github' });
      }
    }
  },

  actions: {
    submitMatch: function(event, action) {
      this.api({ provider: 'github', path: 'repos/' + action.data.repo + '/languages' }, function(languages) {
        $.post('/matches', {
          repo: action.data.repo,
          languages: _.keys(languages).join(',')
        }, function(res) { console.warn("Res", res); });        
      })
    }
  }

});