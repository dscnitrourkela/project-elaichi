import React from 'react';

// Libraries
import { faSearch } from '@fortawesome/free-solid-svg-icons';
import { useQuery } from 'react-query';

// Components
import {
  PageTitle,
  NavTabs,
  MailCard,
  FloatingActionButton,
  Loading,
  Error
} from 'components';

// Assets
import './styles.scss';
import { changeHistory, getQueryParam } from 'utils';
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

const fetchInbox = async () => {
  const {
    data: { m: data }
  } = await api.get<{ m: DataType[] }>('/', {
    params: {
      url: 'inbox.json'
    },
    headers: {
      Accept: '*/*'
    }
  });

  return data;
};

const Home: React.FC = () => {
  const {
    data: inbox,
    error: inboxError,
    isLoading: inboxIsLoading
  } = useQuery<DataType[], Error>(['home', 'inbox'], fetchInbox);

  if (inboxError) {
    return <Error />;
  }

  if (inboxIsLoading) {
    return <Loading />;
  }

  return (
    <div className="page-wrapper">
      <div className="head-container">
        <PageTitle title="Webmail" icon={{ icon: faSearch }} />

        <NavTabs />
      </div>

      {inbox && (
        <div className="body-container">
          {inbox.map(
            ({
              s: size,
              // d: date,
              // l: box,
              cid: conversationalId,
              // f: flag,
              // rev,
              id,
              e: mailList,
              su: subject,
              fr: body
            }) => (
              <MailCard
                key={`${size}-${id}-${conversationalId}`}
                mailId={mailList[mailList.length - 1]?.a || ''}
                subject={subject.substring(0, 42) + '...'}
                excerpt={body.substring(0, 48) + '...'}
                onClick={() =>
                  changeHistory(
                    'push',
                    `/view/${id}?zauthtoken=${getQueryParam('zauthtoken')}`
                  )
                }
              />
            )
          )}
        </div>
      )}

      <FloatingActionButton onClick={() => {}} />
    </div>
  );
};

export default Home;
