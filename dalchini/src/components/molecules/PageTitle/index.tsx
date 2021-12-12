import React from 'react';

// Libraries
import cx from 'classnames';
import {
  FontAwesomeIcon,
  FontAwesomeIconProps
} from '@fortawesome/react-fontawesome';
import { faChevronLeft } from '@fortawesome/free-solid-svg-icons';

// Components
import { Flexbox, H1 } from 'components';

// Assets
import './styles.scss';

export interface PageTitleProps {
  title: string;
  icon?: FontAwesomeIconProps;
  customBackAction?: () => void;
}

const PageTitle: React.FC<PageTitleProps> = ({
  title,
  icon,
  customBackAction
}) => {
  return (
    <Flexbox
      justifyCenter
      alignCenter
      className={cx(
        customBackAction && 'border-bottom',
        'page-title-container'
      )}
    >
      {customBackAction && (
        <FontAwesomeIcon
          className="back-icon"
          icon={faChevronLeft}
          onClick={customBackAction}
        />
      )}

      <H1>{title}</H1>

      {icon && <FontAwesomeIcon className="icon" {...icon} />}
    </Flexbox>
  );
};

export default PageTitle;
