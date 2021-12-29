{
  outputs = {self, ...}: {
    templates = {
      bash_cli = {
        path = ./bash_cli;
        description = "simple bash cli skeleton";
      };
      simple = {
        path = ./simple;
        description = "simple minimal flake";
      };
    };
    defaultTemplate = self.templates.simple;
  };   
}
