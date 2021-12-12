import React from 'react';

// Libraries
import { faEnvelope } from '@fortawesome/free-solid-svg-icons';

// Components
import { PageTitle, H2, P1, HighlightText, Container } from 'components';

// Assets
import './styles.scss';
import { changeHistory } from 'utils';

const MailView = () => {
  return (
    <div className="page-wrapper" style={{ paddingTop: '70px' }}>
      <div className="head-container">
        <PageTitle
          title=""
          customBackAction={() => changeHistory('back')}
          icon={{ icon: faEnvelope }}
        />
      </div>

      <Container>
        <div
          className="body-container add-child-margin"
          style={{ background: 'var(--color-background-primary)' }}
        >
          <P1 style={{ fontWeight: '500' }}>Feb 06 2020</P1>
          <H2>
            NITRKL GroupMail: Guidelines for applying R1 forms online in NITRIS
            portal
          </H2>
          <P1>
            From <HighlightText>kcpati@nitrkl.ac.in</HighlightText> to you{' '}
          </P1>
          <P1>
            Thestudents are hereby advised to apply for following R1 forms
            online in NITRIS portal.
          </P1>
          <P1>(1) Studentship Certificate</P1>
          <P1>(2) Conduct certificate</P1>
          <P1>(3) Grade sheet</P1>
          <P1>(4) Fee Structure</P1>
          <P1>(5)Language Certificate</P1>
          <P1>(6)NOC for Passport</P1>
          <P1>
            After your application is successfully, submitted, concerned Faculty
            Advisorwill verify the same. If your application is verified and
            recommended, you willget desired certificate (scanned copy) in your
            webmail within seven workingdays of recommendation by the Faculty
            Advisor (exception being, issue of NOCfor Passport that may take ten
            working days).{' '}
          </P1>
          <P1>
            However,if you want the above certificates in specific format as
            prescribed bydifferent agencies (for example: NSP, STAR Scholarship,
            CAT admissions or anyother Govt./semi Govt./Pvt. bodies or
            Universities from India or abroad), thesame may please be duly
            filled up and sent via email to acad.ug@nitrkl.ac.in. The details
            provided therein shall be verified at our end.If found in order in
            all respect as per Institute rules, the same shall becertified by
            the authorized signatory and mailed to your webmail within
            sevenworking days.
          </P1>{' '}
          <P1>
            Nofollow up emails/texts/WhatsApp messages/Phone calls regarding the
            same will beentertained. In case of any difficulty/clarification,
            please contact concernedFaculty Advisor. Thanking you. With sincere
            regards, Swagatika Sahoo Assistant Registrar Academics (UG & PG)
            National Institute of Technology Rourkela Rourkela, Odisha: 769008.
          </P1>
        </div>
      </Container>
    </div>
  );
};

export default MailView;
