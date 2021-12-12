import React from 'react';

// Libraries
import cx from 'classnames';

// Assets;
import './styles.scss';

const H2: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
> = ({ children, className, ...rest }) => (
  <h2 className={cx('secondary-heading', className)} {...rest}>
    {children}
  </h2>
);

export default H2;
