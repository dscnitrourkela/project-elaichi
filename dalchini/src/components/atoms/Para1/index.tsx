import React from 'react';

// Libraries
import cx from 'classnames';

// Assets;
import './styles.scss';

const P1: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLParagraphElement>,
    HTMLParagraphElement
  >
> = ({ children, className, ...rest }) => (
  <p className={cx('primary-para', className)} {...rest}>
    {children}
  </p>
);

export default P1;
