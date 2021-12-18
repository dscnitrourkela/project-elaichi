import React from 'react';

// Libraries
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faTimes } from '@fortawesome/free-solid-svg-icons';

// Components
import { Flexbox } from 'components';

// Assets
import MailLoading from 'assets/mail-loading.gif';
import './styles.scss';
import { changeHistory } from 'utils';

const Loading: React.FC<{ showClose?: boolean }> = ({ showClose = false }) => {
  return (
    <Flexbox justifyCenter alignCenter className="loading-container">
      {showClose && (
        <FontAwesomeIcon
          onClick={() => changeHistory('back')}
          icon={faTimes}
          className="close-icon"
        />
      )}

      <img alt="Loading content" src={MailLoading} className="loading-img" />
    </Flexbox>
  );
};

export default Loading;
