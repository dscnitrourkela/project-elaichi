import React from 'react';

// Libraries
import cx from 'classnames';

// Assets
import './styles.scss';

const P2: React.FC<
  React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLParagraphElement>,
    HTMLParagraphElement
  >
> = ({ children, className, ...rest }) => (
  <p className={cx('secondary-para', className)} {...rest}>
    {children}
  </p>
);

export default P2;
