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

const Home: React.FC = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => setLoading(false), 5000);
    const fetchData = async () => {
      try {
        console.time();
        const { data } = await api.get('/', {
          params: {
            // url: 'inbox.json'
            // url: '/',
            id: 13440
          },
          headers: {
            Accept: '*/*'
          }
        });
        console.log(data);
      } catch (error) {
        console.error(error);
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

      {loading ? (
        <Flexbox justifyCenter alignCenter className="loading-container">
          <img alt="Mails Loading" src={MailLoading} />
        </Flexbox>
      ) : (
        <>
          <div className="body-container">
            {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(number => (
              <MailCard
                key={number}
                mailId="kcpati@nitrkl.ac.in"
                subject="NITRKL GroupMail: webinar of relationship..."
                excerpt="Dear Faculty/Staff/Student, Institute Counselling..."
                onClick={() => changeHistory('push', `/view/${number}`)}
              />
            ))}
          </div>

          <FloatingActionButton
            // onClick={() => changeHistory('push', 'compose')}
            onClick={() =>
              window.open(
                // eslint-disable-next-line max-len
                'https://mail.nitrkl.ac.in/service/home/~/?auth=qp&zauthtoken=0_f87c11d0d73d10073bbcc0b44c56288e90e2f5f1_69643d33363a39393135363736382d326566662d343162352d613533302d3834316664353035306337323b6578703d31333a313633393735363334313434353b747970653d363a7a696d6272613b7469643d393a3536363334343533363b76657273696f6e3d31333a382e362e305f47415f313135333b&view=text&id=13440&part=2',
                '_blank'
              )
            }
          />
        </>
      )}
    </div>
  );
};

export default Home;
