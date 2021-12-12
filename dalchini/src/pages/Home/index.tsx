import React from 'react';

// Libraries
import { faSearch } from '@fortawesome/free-solid-svg-icons';

// Components
import { PageTitle, NavTabs, MailCard, FloatingActionButton } from 'components';

// Assets
import './styles.scss';
import { changeHistory } from 'utils';

const Home: React.FC = () => {
  return (
    <div className="page-wrapper">
      <div className="head-container">
        <PageTitle title="Webmail" icon={{ icon: faSearch }} />

        <NavTabs />
      </div>

      <div className="body-container">
        {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(number => (
          <MailCard
            key={number}
            mailId="kcpati@nitrkl.ac.in"
            subject="NITRKL GroupMail: webinar of relationship..."
            excerpt="Dear Faculty/Staff/Student, Institute Counselling Services is..."
            onClick={() => changeHistory('push', `/view/${number}`)}
          />
        ))}

        <FloatingActionButton
          onClick={() => changeHistory('push', 'compose')}
        />
      </div>
    </div>
  );
};

export default Home;
