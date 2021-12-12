import { history } from 'utils';

const changeHistory = (action: 'push' | 'back', path?: string): void => {
  if (action === 'push' && path) {
    history.push(path);
  } else {
    history.goBack();
  }
};

export default changeHistory;
