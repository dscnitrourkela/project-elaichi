import React from 'react';

// Components
import { Container, HighlightText, H3, P1, Flexbox } from 'components';

// Assets
import './styles.scss';

export interface MailCardProps {
  mailId: string;
  subject: string;
  excerpt: string;
  onClick: () => void;
}

const MailCard: React.FC<MailCardProps> = ({
  mailId,
  subject,
  excerpt,
  onClick
}) => {
  return (
    <div
      className="mailcard-container animated clicking-animation"
      onClick={onClick}
    >
      <Container style={{ height: '100%' }}>
        <Flexbox
          flexColumn
          justifyBetween
          alignStart
          className="mailcard-flexbox"
        >
          <HighlightText>{mailId}</HighlightText>
          <H3
            style={{
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              display: 'inline',
              width: '100%'
            }}
          >
            {subject}
          </H3>
          <P1
            style={{
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              display: 'inline',
              width: '100%'
            }}
          >
            {excerpt}
          </P1>
        </Flexbox>
      </Container>
    </div>
  );
};

export default MailCard;
