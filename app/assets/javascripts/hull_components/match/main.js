Hull.widget('match', {
  templates: ['signup_form', 'matches'],
  datasources: {
    matches: function() {
      // Fetch data from your server here... for search results
    },

    repos: function() {
      if (this.options.login) {
        return this.api({ path: 'users/' + this.options.login + '/repos', provider: 'github', params: { per_page: 50 } });
      }
    }

  },

  beforeRender: function(data) {
    data.languages = ['rb', 'js', 'py'];
    data.levels    =  ['expert', 'rock star'];
    console.warn("Form @", data);
  },

  events: {
    'submit form': function(e) {
      console.warn("Submitted Form !");
      if (e)  {
        e.preventDefault(); 
        e.stopPropagation()
      };
      return false;
    }
  }

});