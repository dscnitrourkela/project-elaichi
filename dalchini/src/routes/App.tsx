import React from 'react';

// Libraries
import { Router, Route, Switch } from 'react-router-dom';

// Components
import { Compose, Home, MailView, Playground } from 'pages';

// Assets
import { history } from 'utils';

const App = () => {
  return (
    <Router history={history}>
      <Switch>
        <Route exact path="/" component={Home} />
        <Route exact path="/view/:id" component={MailView} />
        <Route exact path="/compose" component={Compose} />
        <Route exact path="/playground" component={Playground} />
      </Switch>
    </Router>
  );
};

export default App;
