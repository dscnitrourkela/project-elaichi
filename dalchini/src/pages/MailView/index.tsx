import React, { useState, useEffect } from 'react';

// Libraries
import { faEnvelope } from '@fortawesome/free-solid-svg-icons';
import { useLocation } from 'react-router-dom';
// eslint-disable-next-line @typescript-eslint/no-var-requires
// const mailparser = require('mailparser');
import { simpleParser } from 'mailparser';

// Components
import { PageTitle, H2, P1, HighlightText, Container } from 'components';

// Assets
import './styles.scss';
import { changeHistory, getQueryParam, api } from 'utils';

const MailView: React.FC = () => {
  const [parsedMail, setParsedMail] = useState<any>(null);
  const { pathname } = useLocation();

  useEffect(() => {
    const fetchData = async () => {
      // eslint-disable-next-line prefer-destructuring
      const id = pathname.split('/')[2];

      const { data } = await api.get('/', {
        params: {
          id
        },
        headers: {
          Accept: '*/*'
        }
      });

      const parsed = await simpleParser(data);
      setParsedMail(parsed);
    };

    fetchData();
  }, [pathname]);

  console.log(parsedMail);

  return (
    <div className="page-wrapper" style={{ paddingTop: '70px' }}>
      <div className="head-container">
        <PageTitle
          title=""
          customBackAction={() => changeHistory('back')}
          icon={{ icon: faEnvelope }}
        />
      </div>

      <Container>
        <div
          className="body-container add-child-margin"
          style={{ background: 'var(--color-background-primary)' }}
        >
          {!parsedMail ? (
            <p>Loading</p>
          ) : (
            <>
              <P1 style={{ fontWeight: '500' }}>
                {new Date(parsedMail.date).toLocaleString()}
              </P1>
              <H2>{parsedMail.subject}</H2>
              <P1>
                From <HighlightText>{parsedMail.from.text}</HighlightText> to
                you{' '}
              </P1>

              <P1 dangerouslySetInnerHTML={{ __html: parsedMail.textAsHtml }} />
            </>
          )}
        </div>
      </Container>
    </div>
  );
};

export default MailView;
