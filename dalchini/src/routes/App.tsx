import React from 'react';

import { H1, H2, H3, P1, P2, HighlightText } from 'components';

const App: React.FC = () => {
  return (
    <div className="app">
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
