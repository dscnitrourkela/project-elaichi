import React from 'react';

// Libraries
import { Router, Route, Switch, useLocation } from 'react-router-dom';
import { useTransition, animated } from 'react-spring';
import { QueryClient, QueryClientProvider } from 'react-query';

// Components
import { Compose, Home, MailView } from 'pages';

// Assets
import { history } from 'utils';

const App: React.FC = () => {
  const location = useLocation();
  const pageTransitions = useTransition(location.pathname, {
    from: { opacity: 0 },
    enter: { opacity: 1 },
    leave: { opacity: 0 }
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
    }
  ];

  return (
    <Switch>
      {pageTransitions((style, item) => {
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
  );
};

const queryClient = new QueryClient();

const MainApp: React.FC = () => {
  return (
    <QueryClientProvider client={queryClient}>
      <Router history={history}>
        <App />
      </Router>
    </QueryClientProvider>
  );
};

export default MainApp;
