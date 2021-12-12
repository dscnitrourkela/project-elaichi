import React from 'react';

// Libraries
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPencilAlt } from '@fortawesome/free-solid-svg-icons';

// Components
import { Flexbox } from 'components';

// Assets
import './styles.scss';

export interface FloatingActionProps {
  onClick: (...args: unknown[]) => void;
}

const FloatingActionButton: React.FC<FloatingActionProps> = ({ onClick }) => {
  return (
    <div className="floating-container animated clicking-animated">
      <Flexbox
        onClick={onClick}
        justifyCenter
        alignCenter
        className="flexbox-container"
      >
        <FontAwesomeIcon icon={faPencilAlt} className="icon" />
      </Flexbox>
    </div>
  );
};

export default FloatingActionButton;
