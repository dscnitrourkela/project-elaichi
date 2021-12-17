/* eslint-disable max-len */
import axios from 'axios';

// Utils
import { getQueryParam } from 'utils';

// Configure and an instance of axios
const api = axios.create({
  baseURL: process.env.REACT_APP_ZIMBRA_URL,
  timeout: 60000,
  timeoutErrorMessage: 'Request Timeout: Please try again',
  params: {
    auth: 'qp',
    zauthtoken: getQueryParam('zauthtoken')
  }
});

export default api;
