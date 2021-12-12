import React, { useState } from 'react';

// Libraries
import cx from 'classnames';

// Components
import { P2, Flexbox, Container } from 'components';

// Assets
import './styles.scss';

const Tabs = [
  {
    name: 'Inbox',
    link: '/'
  },
  {
    name: 'Sent',
    link: '/sent-mail'
  },
  {
    name: 'Drafts',
    link: '/drafts'
  },
  {
    name: 'Junk',
    link: '/junk'
  },
  {
    name: 'Trash',
    link: '/trash'
  }
];

const NavTabs: React.FC = () => {
  const [activeTab, setActiveTab] = useState(0);

  return (
    <div
      style={{
        borderBottom: '1px solid var(--color-text-quaternary)',
        background: 'var(--color-background-primary)'
      }}
    >
      <Container>
        <Flexbox justifyStart alignCenter className="nav-container">
          {Tabs.map(({ name }, index) => (
            <P2
              key={name}
              className={cx('nav-item', activeTab === index && 'active-tab')}
              onClick={() => setActiveTab(index)}
            >
              {name}
            </P2>
          ))}

          <div className={cx('highlight', `left-${activeTab}`)} />
        </Flexbox>
      </Container>
    </div>
  );
};

export default NavTabs;
