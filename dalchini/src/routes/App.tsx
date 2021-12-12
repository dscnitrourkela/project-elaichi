import React from 'react';

import { faSearch } from '@fortawesome/free-solid-svg-icons';

import {
  H1,
  H2,
  H3,
  P1,
  P2,
  HighlightText,
  PageTitle,
  NavTabs,
  MailCard
} from 'components';

const App: React.FC = () => {
  return (
    <>
      <PageTitle
        title="Webmail"
        icon={{ icon: faSearch }}
        // customBackAction={() => console.log('hello')}
      />
      <NavTabs />

      <div
        style={{
          width: '100%',
          height: '100vh',
          background: 'var(--color-background-secondary)'
        }}
      >
        {[1, 2, 3, 4, 5, 6, 7].map(number => (
          <MailCard
            key={number}
            mailId="kcpati@nitrkl.ac.in"
            subject="NITRKL GroupMail: webinar of relationship..."
            excerpt="Dear Faculty/Staff/Student, Institute Counselling Services is..."
          />
        ))}
      </div>

      <H1>Heading1</H1>
      <H2>Heading2</H2>
      <H3>Heading3</H3>
      <P1>Paragraph1</P1>
      <P2>Paragraph2</P2>
      <HighlightText>HighlightText</HighlightText>
    </>
  );
};

export default App;
