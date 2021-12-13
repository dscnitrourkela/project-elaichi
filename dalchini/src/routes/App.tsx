import React from 'react';

// Libraries
import { Router, Route, Switch, useLocation } from 'react-router-dom';
import { useTransition, animated } from 'react-spring';

// Components
import { Compose, Home, MailView, Playground } from 'pages';

// Assets
import { history } from 'utils';

const App: React.FC = () => {
  const location = useLocation();
  const transitions = useTransition(location.pathname, {
    from: { transform: 'translateX(100vw)' },
    enter: { transform: 'translateX(0)' },
    leave: { transform: 'translateX(-50vw)' }
  });

  const ROUTES = [
    {
      path: '/',
      component: Home
    },
    {
      path: '/view/:id',
      component: MailView
    },
    {
      path: '/compose',
      component: Compose
    },
    {
      path: '/playground',
      component: Playground
    }
  ];

  return (
    <>
      <Switch>
        {transitions((style, item) => {
          const RouteDetails = ROUTES.filter(({ path }) =>
            item.split('/')[1] === 'view'
              ? item.split('/')[1] === path.split('/')[1]
              : item === path
          );

          return (
            <animated.div style={style}>
              <Route
                exact
                path={RouteDetails[0].path}
                component={RouteDetails[0].component}
              />
            </animated.div>
          );
        })}
      </Switch>
    </>
  );
};

const MainRouter: React.FC = () => {
  return (
    <Router history={history}>
      <App />
    </Router>
  );
};

export default MainRouter;
