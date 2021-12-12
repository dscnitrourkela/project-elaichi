import React from 'react';

import { faSearch } from '@fortawesome/free-solid-svg-icons';

import { H1, H2, H3, P1, P2, HighlightText, PageTitle } from 'components';

const App: React.FC = () => {
  return (
    <div className="app">
      <PageTitle
        title="Webmail"
        icon={{ icon: faSearch }}
        customBackAction={() => console.log('hello')}
      />
      <H1>Heading1</H1>
      <H2>Heading2</H2>
      <H3>Heading3</H3>
      <P1>Paragraph1</P1>
      <P2>Paragraph2</P2>
      <HighlightText>HighlightText</HighlightText>
    </div>
  );
};

export default App;
