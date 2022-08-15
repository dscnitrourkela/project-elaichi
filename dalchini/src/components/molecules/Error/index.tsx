import React from 'react';

// Libraries
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faTimes } from '@fortawesome/free-solid-svg-icons';

// Components
import { Flexbox, H1, HighlightText } from 'components';

// Assets
import MailError from 'assets/mail-error.gif';
import './styles.scss';
import { changeHistory } from 'utils';

const Error: React.FC = () => {
  return (
    <Flexbox flexColumn justifyCenter alignCenter className="error-container">
      <FontAwesomeIcon
        onClick={() => changeHistory('back')}
        icon={faTimes}
        className="close-icon"
      />

      <img alt="Loading content" src={MailError} className="error-img" />

      <H1>
        <HighlightText className="error-text">
          Oops, Something went wrong!
        </HighlightText>
      </H1>
    </Flexbox>
  );
};

export default Error;
