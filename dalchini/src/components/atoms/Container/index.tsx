import React from 'react';

// Libraries
import cx from 'classnames';

// Assets
import './styles.scss';

const Container: React.FC<
  React.DetailedHTMLProps<React.HTMLAttributes<HTMLDivElement>, HTMLDivElement>
> = ({ children, className, ...rest }) => (
  <div className={cx('container', className)} {...rest}>
    {children}
  </div>
);

export default Container;
