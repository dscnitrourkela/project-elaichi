import { ParsedMail, simpleParser } from 'mailparser';
import { api } from 'utils';

export const fetchMail = async (id: string): Promise<ParsedMail> => {
  const { data } = await api.get('/', {
    params: {
      id
    },
    headers: {
      Accept: '*/*'
    }
  });

  const parsed = await simpleParser(data);
  return parsed;
};
