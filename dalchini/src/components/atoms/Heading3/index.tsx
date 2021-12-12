import React from 'react';

// Libraries
import cx from 'classnames';

// Assets;
import './styles.scss';

const H3: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLHeadingElement>,
    HTMLHeadingElement
  >
> = ({ children, className, ...rest }) => (
  <h3 className={cx('tertiary-heading', className)} {...rest}>
    {children}
  </h3>
);

export default H3;
