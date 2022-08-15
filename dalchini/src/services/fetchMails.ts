import { api } from 'utils';

export interface DataType {
  s: number;
  d: number;
  l: string;
  cid: string;
  f: string;
  rev: number;
  id: string;
  e: {
    a: string;
    d: string;
    p: string;
    t: string;
  }[];
  su: string;
  fr: string;
}

export const fetchMails = async (tab: string) => {
  const {
    data: { m: data }
  } = await api.get<{ m: DataType[] }>('/', {
    params: {
      url: tab ? `${tab}.json` : 'inbox.json'
    },
    headers: {
      Accept: '*/*'
    }
  });

  return data;
};
