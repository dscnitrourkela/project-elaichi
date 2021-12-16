import React, { useEffect, useState } from 'react';

// Libraries
import { faSearch } from '@fortawesome/free-solid-svg-icons';

// Components
import {
  PageTitle,
  NavTabs,
  MailCard,
  FloatingActionButton,
  Flexbox
} from 'components';

// Assets
import './styles.scss';
import { changeHistory } from 'utils';
import MailLoading from 'assets/mail-loading.gif';
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

const Home: React.FC = () => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const [data, setData] = useState<DataType[] | null>(null);

  useEffect(() => {
    setTimeout(() => setLoading(false), 5000);
    const fetchData = async () => {
      try {
        const {
          data: { m: mails }
        } = await api.get('/', {
          params: {
            url: 'inbox.json'
            // id: 13440
          },
          headers: {
            Accept: '*/*'
          }
        });
        setData(mails);
        setLoading(false);
        setError(false);
      } catch (err) {
        setError(true);
      }
    };

    fetchData();
  }, []);

  return (
    <div className="page-wrapper">
      <div className="head-container">
        <PageTitle title="Webmail" icon={{ icon: faSearch }} />

        <NavTabs />
      </div>

      {!loading && !error && data ? (
        <>
          <div className="body-container">
            {data.map(
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
                  onClick={() => changeHistory('push', `/view/${id}`)}
                />
              )
            )}
          </div>

          <FloatingActionButton onClick={() => {}} />
        </>
      ) : (
        <Flexbox justifyCenter alignCenter className="loading-container">
          <img alt="Mails Loading" src={MailLoading} />
        </Flexbox>
      )}
    </div>
  );
};

export default Home;
