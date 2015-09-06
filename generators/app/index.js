var generators = require('yeoman-generator');

var copyTemplate = function(filename) {
  this.fs.copyTpl(
    this.templatePath('index.html'),
    this.destinationPath('public/index.html'),
    { title: 'Templating with Yeoman' }
  );
};

module.exports = generators.Base.extend({
  model: {
    app: {}
  },

  initializing: {

    createRootConfig: function() {
      this.config.save();
    },

    promptForAppName: function () {
      var done = this.async();
      this.prompt({
        type    : 'input',
        name    : 'name',
        message : 'Your project name',
        default : this.appname
      }, function (answers) {
        this.model.app.name = answers.name;
        done();
      }.bind(this));
    },

    promptForAppDescription: function() {
      var done = this.async();
      this.prompt({
        type    : 'input',
        name    : 'description',
        message : 'Your app description',
        default : 'No description'
      }, function (answers) {
        this.model.app.description = answers.description;
        done();
      }.bind(this));
    }

  },


  copyTemplates: function() {
    this.fs.copyTpl(
      this.templatePath('**/*'),
      this.destinationPath('./'),
      this.model
    );
  }

});