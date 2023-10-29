import React, { useState } from 'react';

// Libraries
import { faSearch } from '@fortawesome/free-solid-svg-icons';
import { useQueries } from 'react-query';

// Components
import {
  PageTitle,
  NavTabs,
  MailCard,
  // FloatingActionButton,
  Loading,
  Error,
  Flexbox,
  HighlightText,
  H1
} from 'components';

// Assets
import './styles.scss';
import { changeHistory, getQueryParam } from 'utils';
import { fetchMails } from 'services';
import MailEmpty from 'assets/mail-empty.gif';

const Home: React.FC = () => {
  const [activeTab, setActiveTab] = useState(0);
  const results = useQueries([
    { queryKey: ['home', 'inbox'], queryFn: () => fetchMails('inbox') },
    { queryKey: ['home', 'sent'], queryFn: () => fetchMails('sent') },
    { queryKey: ['home', 'drafts'], queryFn: () => fetchMails('drafts') },
    { queryKey: ['home', 'junk'], queryFn: () => fetchMails('junk') },
    { queryKey: ['home', 'trash'], queryFn: () => fetchMails('trash') }
  ]);

  if (results[activeTab].error) {
    return <Error />;
  }

  if (results[activeTab].isLoading) {
    return <Loading />;
  }

  return (
    <div className="page-wrapper">
      <div className="head-container">
        <PageTitle title="Webmail" icon={{ icon: faSearch }} />

        <NavTabs activeTab={activeTab} setActiveTab={setActiveTab} />
      </div>

      <div className="body-container">
        {!results[activeTab].data ? (
          <Flexbox
            justifyCenter
            alignCenter
            flexColumn
            className="empty-mail-container"
          >
            <img
              alt="Mail List empty"
              src={MailEmpty}
              className="empty-mail-img"
            />

            <H1>
              <HighlightText className="empty-mail-msg">
                No mails to show...
              </HighlightText>
            </H1>
          </Flexbox>
        ) : (
          results[activeTab].data?.map(
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
                subject={subject?.substring(0, 42) + '...'}
                excerpt={body?.substring(0, 48) + '...'}
                onClick={() =>
                  changeHistory(
                    'push',
                    `/view/${id}?zauthtoken=${getQueryParam('zauthtoken')}`
                  )
                }
              />
            )
          )
        )}
      </div>
      {/* TODO:- Add it back when the logic to compose is written down */}
      {/* <FloatingActionButton onClick={() => {}} /> */}
    </div>
  );
};

export default Home;
