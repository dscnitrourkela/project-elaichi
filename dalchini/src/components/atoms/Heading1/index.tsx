import React from 'react';

// Libraries
import cx from 'classnames';

// Assets;
import './styles.scss';

const H1: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
> = ({ children, className, ...rest }) => (
  <h1 className={cx('primary-heading', className)} {...rest}>
    {children}
  </h1>
);

export default H1;
