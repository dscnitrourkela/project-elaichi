/* eslint-disable max-len */
import axios from 'axios';

// Configure and an instance of axios
const api = axios.create({
  baseURL: 'https://cross-origin-request.dscnitrourkela.workers.dev',
  timeout: 60000,
  timeoutErrorMessage: 'Request Timeout: Please try again',
  params: {
    auth: 'qp',
    zauthtoken:
      '0_f87c11d0d73d10073bbcc0b44c56288e90e2f5f1_69643d33363a39393135363736382d326566662d343162352d613533302d3834316664353035306337323b6578703d31333a313633393735363334313434353b747970653d363a7a696d6272613b7469643d393a3536363334343533363b76657273696f6e3d31333a382e362e305f47415f313135333b'
  }
});

export default api;
