import React from 'react';

// Libraries
import cx from 'classnames';

// Assets;
import './styles.scss';

const P2: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLSpanElement>,
    HTMLSpanElement
  >
> = ({ children, className, ...rest }) => (
  <span className={cx('highlight-text', className)} {...rest}>
    {children}
  </span>
);

export default P2;
