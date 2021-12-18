import React from 'react';

// Libraries
import { faDownload, faEnvelope } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { useLocation } from 'react-router-dom';
import { simpleParser, ParsedMail } from 'mailparser';
import { useQuery } from 'react-query';

// Components
import {
  PageTitle,
  H2,
  P1,
  P2,
  HighlightText,
  Container,
  Flexbox
} from 'components';

// Assets
import './styles.scss';
import { changeHistory, api, getQueryParam } from 'utils';

// @ts-ignore
function downloadURI(uri, name) {
  const link = document.createElement('a');
  link.setAttribute('download', name);
  link.setAttribute('href', uri);
  link.setAttribute('target', '_blank');
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
}

const fetchMail = async (id: string) => {
  const { data } = await api.get('/', {
    params: {
      id
    },
    headers: {
      Accept: '*/*'
    }
  });

  const parsed = await simpleParser(data);
  return parsed;
};

const MailView: React.FC = () => {
  const { pathname } = useLocation();

  const {
    data: parsedMail,
    isLoading,
    error
  } = useQuery<ParsedMail, Error>(['mail', pathname], () =>
    fetchMail(pathname.split('/')[2])
  );

  if (error) {
    return <>Error loading inbox mails</>;
  }

  if (isLoading) {
    <Flexbox justifyCenter alignCenter className="loading-container">
      Loading...
    </Flexbox>;
  }

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
          {parsedMail && (
            <>
              <P1 style={{ fontWeight: '500' }}>
                {new Date(parsedMail.date || '').toLocaleString()}
              </P1>
              <H2>{parsedMail.subject}</H2>
              <P1>
                From{' '}
                <HighlightText>{parsedMail?.from?.text || ''}</HighlightText> to
                you{' '}
              </P1>

              <P1
                dangerouslySetInnerHTML={{
                  __html:
                    (parsedMail?.from?.text.split('@')[1] === 'nitrkl.ac.in'
                      ? parsedMail.textAsHtml
                      : parsedMail.html) || ''
                }}
              />

              {parsedMail.attachments.length > 0 && (
                <Flexbox
                  flexColumn
                  justifyStart
                  alignStart
                  className="attachments-container"
                >
                  {parsedMail.attachments.map(
                    // @ts-ignore
                    ({ checksum, filename, partId }) => (
                      <Flexbox
                        justifyStart
                        alignCenter
                        key={checksum}
                        className="attachment"
                        onClick={() =>
                          downloadURI(
                            `https://mail.nitrkl.ac.in/home/~/?auth=qp&zauthtoken=${getQueryParam(
                              'zauthtoken'
                            )}&id=${pathname.split('/')[2]}&part=${partId}`,
                            filename
                          )
                        }
                      >
                        <FontAwesomeIcon icon={faDownload} />

                        <P2>{filename}</P2>
                      </Flexbox>
                    )
                  )}
                </Flexbox>
              )}
            </>
          )}
        </div>
      </Container>
    </div>
  );
};

export default MailView;
