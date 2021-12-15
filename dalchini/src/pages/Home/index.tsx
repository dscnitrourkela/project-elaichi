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

const Home: React.FC = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => setLoading(false), 5000);
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
            onClick={() => changeHistory('push', 'compose')}
          />
        </>
      )}
    </div>
  );
};

export default Home;
